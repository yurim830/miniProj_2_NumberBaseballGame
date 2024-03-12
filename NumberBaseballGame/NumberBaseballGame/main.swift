/*  Lv1
- [ ]  1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다
- [ ]  정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)
*/

// 랜덤 : Type.random(in:) https://developer.apple.com/documentation/swift/int/random(in:)-9mjpw

var answer: [Int] = []
while answer.count < 3 {
    var temp = Int.random(in: 0...9)
    if !answer.contains(temp) {
        answer.append(temp)
    }
    
}

print(answer)
