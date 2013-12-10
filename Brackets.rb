#A string S consisting of N characters is considered to be properly nested if any of the following conditions is true:
#S is empty;
#S has the form "(U)" or "[U]" or "{U}" where U is a properly nested string;
#S has the form "VW" where V and W are properly nested strings.
#For example, the string "{[()()]}" is properly nested but "([)()]" is not.
#Write a function:
#def solution(s)
#that, given a string S consisting of N characters, returns 1 if S is properly nested and 0 otherwise.
#For example, given S = "{[()()]}", the function should return 1 and given S = "([)()]", the function should return 0, as explained above.
#Assume that:
#N is an integer within the range [0..200,000];
#string S consists only of the following characters: "(", "{", "[", "]", "}" and/or ")".
#Complexity:
#expected worst-case time complexity is O(N);
#expected worst-case space complexity is O(N) (not counting the storage required for input arguments).


def solution(s)
  return 1 if s.empty?

  # 1 - {}
  # 2 - []
  # 3 - ()

  stack = []

  closing = ["}", "]", ")"]
  opening = ["{", "[", "("]
  s.each_char do |e|
    if closing.include? e
      if stack.last == opening[closing.index(e)]
        stack.pop
      else
        stack << e
      end
    elsif opening.include? e
      stack << e
    end
  end

  stack.empty? ? 1 : 0
end

p solution('{[()()]}')

# grade:
# https://codility.com/demo/results/demoXNAB6V-4EY/
