class BaseballGame {
    // 프로그램 시작 ------------------------------------------
    var guessRecords: [Int] = []
    let game = RunGame()
    
    // ** 메인 메뉴 **
    func mainMenu() {
        showMenu()
        chooseMenu()
    }
    
    // ************************** 함수 구현 **************************
    
    // 메인메뉴 보이기---------------------------------------------
    func showMenu() {
        print("""
========================================
<메인메뉴>
환영합니다! 원하시는 번호를 입력해주세요.
1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
========================================
""")
    }
    
    // 메뉴 선택하기-----------------------------------------------
    func chooseMenu() {
        if let menu = readLine() {
            switch menu {
            case "1" :
                if let guessCount = game.gameStart() {
                    guessRecords.append(guessCount)
                }
            case "2" : viewRecords()
            case "3" : quit()
            default :
                print("1, 2, 3 중에서 입력해주세요.")
            }
        }
    }
    
    // case 2
    // 게임 기록 보기 ---------------------------------------------
    func viewRecords() {
        print("< 게임 기록 보기 >")
        for (round, guess) in guessRecords.enumerated() {
            print("\(round + 1)번째 게임 : 시도 횟수 - \(guess)")
        }
        print()
        mainMenu()
    }
    
    
    // case 3
    // 게임 종료하기 ------------------------------------------------
    func quit() {
        print("< 숫자 야구 게임을 종료합니다 > ")
        exit(0)
    }
    
}
