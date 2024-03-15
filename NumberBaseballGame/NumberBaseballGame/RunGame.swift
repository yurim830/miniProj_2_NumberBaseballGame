//** 1. 게임 시작하기 **

class RunGame {
    var answer: [Int] = []
    var guessCount: Int = 0
    
    // 숫자 맞히기 게임 시작
    func gameStart () -> Int? {
        print("< 게임을 시작합니다 >")
        // 정답 세팅
        setAnswer()
        
        // 게임 진행
        while true {
            // 값 입력 ---------------------------------
            print("숫자를 입력하세요")
            let arrInput = getValidInput()
            if arrInput == [-1] {
                print(">> 올바르지 않은 입력값입니다.\n")
                continue
            }
            
            // 정답 비교 ----------------------------------------------
            if isCorrect(arrInput) {
                break
            }
        }
        return guessCount
    }
    
    
    // ************************** 함수 구현 **************************
    
    // 정답 세팅 -------------------------------------------
    func setAnswer() {
        answer = []
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
    }
    
    // 유효한 값 받기  ---------------------------------------------
    func getValidInput() -> [Int] {
        let input = readLine() ?? ""
        guessCount += 1
        
        // 유효 여부 확인
        // 3자리 숫자인가?
        if Int(input) != nil && input.count == 3 {
            let arrInput = Array(input).map {Int(String($0))!}
            // 중복되는 숫자가 없는가?
            if Set<Int>(arrInput).count == 3 {
                return arrInput                       // 3자리 숫자이고 중복되는 숫자가 없을 때
            }
        }
        return [-1]                               // 그 외의 경우
    }
   
    // 입력값과 정답 비교 ------------------------------------------
    func isCorrect(_ arrInput: [Int]) -> Bool {
        var ball: Int = 0
        var strike: Int = 0
        
        // 비교
        for (i, num) in arrInput.enumerated() {
            if num == answer[i] {
                strike += 1
            } else if answer.contains(num) {
                ball += 1
            }
        }
            
        // 비교 결과
        guard strike == 3 else {
            if strike > 0 && ball > 0 {
                print(">> \(strike)스트라이크 \(ball)볼\n")
            } else if strike > 0 {
                print(">> \(strike)스트라이크\n")
            } else if ball > 0 {
                print(">> \(ball)볼\n")
            } else {
                print(">> Nothing\n")
            }
            return false
        }
        print(">> 정답입니다!\n")
        return true
    }
}
