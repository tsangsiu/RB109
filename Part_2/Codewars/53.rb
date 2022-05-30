=begin

A child is playing with a ball on the nth floor of a tall building. The height of this floor, h, is known.

He drops the ball out of the window. The ball bounces (for example), to two-thirds of its height (a bounce of 0.66).

His mother looks out of a window 1.5 meters from the ground.

How many times will the mother see the ball pass in front of her window (including when it's falling and bouncing?

Three conditions must be met for a valid experiment:
Float parameter "h" in meters must be greater than 0
Float parameter "bounce" must be greater than 0 and less than 1
Float parameter "window" must be less than h.
If all three conditions above are fulfilled, return a positive integer, otherwise return -1.

Note:
The ball can only be seen if the height of the rebounding ball is strictly greater than the window parameter.

Example:
- h = 3, bounce = 0.66, window = 1.5, result is 3

- h = 3, bounce = 1, window = 1.5, result is -1 
(Condition 2) not fulfilled).

# Problem
- A ball is drop from a building of height `h`
- The ball is rebounce to the height `h` * `bounce`
- A person looks out at window at height `window
- By how many times that persons will see the ball passes?
- Return -1 if one of the following does not fulfilled
  - h > 0
  - 0 < bounce < 1
  - window < h
- Input: 3 float parameters: `h`, `bounce` and `window`
- Output: Integer

# Algorithm
- return -1 if not(height >0 and 0<bounce<1 and window < h)
- Initialize `count` to 0
- Increment `count` by 1 if `h` is greater than or equal to `window`
- Loop
  - Set `h` = `h` * `bounce`
  - If `h` > `window`,
    - Increment `count` by 2
  - Else
    - break the loop
- Return `count`

=end

def bouncingBall(height, bounce, window)
  return -1 if !(height > 0 && bounce > 0 && bounce < 1 && window < height)
  count = 0
  count += 1 if height > window
  loop do
    height *= bounce
    height > window ? count += 2 : break
  end
  count
end

p bouncingBall(3, 0.66, 1.5) == 3
p bouncingBall(30, 0.66, 1.5) == 15
p bouncingBall(30, 0.75, 1.5) == 21
p bouncingBall(30, 0.4, 10) == 3
p bouncingBall(40, 1, 10) == -1
p bouncingBall(-5, 0.66, 1.5) == -1
p bouncingBall(1, 0.66, 0.66) == 1
p bouncingBall(1, 0.66, 1) == -1
 
