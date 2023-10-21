import UIKit

class Solution {
    func findNumbers(_ nums: [Int]) -> Int {
        var count = 0
        
        for num in nums {
            var digit = 0
            var tempdigit = num
            
            while tempdigit != 0 {
                tempdigit / 10
                digit += 1
                
            }
            
            if tempdigit % 2 == 0 {
                count += 1
            }
            
            
        }
        
        return count
    }
}

let nums = [12,345,2,6,7896]
var solution = Solution()
solution.findNumbers(nums)

    



