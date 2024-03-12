/*  Lv1
- [ ]  1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다
- [ ]  정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)
*/

// 랜덤 : Type.random(in:) https://developer.apple.com/documentation/swift/int/random(in:)-9mjpw

// 정답 세팅 -----------------------------------
var answer: [Int] = []
while answer.count < 3 {
    let temp = Int.random(in: 0...9)
    if !answer.contains(temp) {
        answer.append(temp)
    }
}
print(answer)


// 게임 시작 -----------------------------------
print("< 게임을 시작합니다 >")

while true {
    var ball: Int = 0
    var strike: Int = 0
    print("숫자를 입력하세요")
    
    // 올바른 입력값인지 확인 후, 올바르면 arrInput에 담기
    var arrInput: [Int] = []
    
    if let input = readLine() {
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
                    print("정답입니다!")
                    break
                }
                if strike > 0 && ball > 0 {
                    print("\(strike)스트라이크 \(ball)볼")
                } else if strike > 0 {
                    print("\(strike)스트라이크")
                } else if ball > 0 {
                    print("\(ball)볼")
                } else {
                    print("Nothing")
                }
            }
        }
    }
    
    

}

