/*  Lv1
- [ ]  1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다
- [ ]  정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)
*/

// 랜덤 : Type.random(in:) https://developer.apple.com/documentation/swift/int/random(in:)-9mjpw



// 프로그램 시작 ------------------------------------------
var guessRecords: [Int] = []
mainMenu()

// ** 메인 메뉴 **
func mainMenu() {
    print("환영합니다! 원하시는 번호를 입력해주세요.")
    print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
    
    
    if let menu = readLine() {
        if menu == "1" {            // 게임 시작하기
            if let guessCount = gameStart() {
                guessRecords.append(guessCount)
            }
            mainMenu()
        } else if menu == "2" {     // 게임 기록 보기
            viewRecords()
        } else if menu == "3" {     // 종료하기
            quit()
        } else {
            print("1, 2, 3 중에서 입력해주세요.")
            mainMenu()
        }
    }
}
// =============================================================================
//  ** 1. 게임 시작하기 **

func gameStart () -> Int? {
    // ----------- 정답 세팅 -----------
    var answer: [Int] = []
    // 첫 번째 숫자
    answer.append(Int.random(in: 1...9))
        
    // 2, 3번째 숫자 추가
    while answer.count < 3 {
        let temp = Int.random(in: 0...9)
        if !answer.contains(temp) {
            answer.append(temp)
        }
    }
    print(answer)

    
    // ----------- 숫자 맞히기 시작 -----------
    print("< 게임을 시작합니다 >")
    var guessCount: Int = 0
    
    while true {
        var ball: Int = 0
        var strike: Int = 0
        print("숫자를 입력하세요")
        
        // 올바른 입력값인지 확인 후, 올바르면 arrInput에 담기
        var arrInput: [Int] = []
        
        if let input = readLine() {
            guessCount += 1
            if Int(input) == nil || input.count > 3 {   // 숫자가 아니거나, 길이가 3 이상일 때
                print("올바르지 않은 입력값입니다\n")
                
            } else {
                arrInput = Array(input).map {Int(String($0))!}
                if Set<Int>(arrInput).count != 3 {     // 숫자를 중복하여 입력했을 때
                    print("올바르지 않은 입력값입니다\n")
                    
                } else {                               // 올바른 값을 입력했을 때
                    // 입력값과 정답 비교
                    for (i, num) in arrInput.enumerated() {
                        if num == answer[i] {
                            strike += 1
                        } else if answer.contains(num) {
                            ball += 1
                        }
                    }
                    // 비교 결과 출력 & 게임 종료
                    if strike == 3 {
                        print("정답입니다!\n")
                        return guessCount
                    }
                    if strike > 0 && ball > 0 {
                        print("\(strike)스트라이크 \(ball)볼\n")
                    } else if strike > 0 {
                        print("\(strike)스트라이크\n")
                    } else if ball > 0 {
                        print("\(ball)볼\n")
                    } else {
                        print("Nothing\n")
                    }
                }
            }
        }
        
        
        
    }
}


// 게임 기록 보기 ---------------------------------------------
func viewRecords() {
    print("< 게임 기록 보기 >")
    for (round, guess) in guessRecords.enumerated() {
        print("\(round + 1)번째 게임 : 시도 횟수 - \(guess)")
    }
    print("==============================\n")
    mainMenu()
}


// 게임 종료하기 ------------------------------------------------
func quit() {
    
}
