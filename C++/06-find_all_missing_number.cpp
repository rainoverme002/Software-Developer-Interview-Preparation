#include <iostream>
#include <vector>

using namespace std;

class FindAllMissingNumber
{
public:
  /* [function] Search
    input: 
      - vector int nums
    output:
      - vector int missing_numbers
    description:
      - Find all the missing number
    assumption:
      - the array is not yet sorted
    example:
      vector<int> v1 = {2, 3, 1, 8, 2, 3, 5, 1};
  */
  static vector<int> Search(vector<int> &nums)
  {
    vector<int> missing_numbers;
    int i = 0;
    
    // sort the nums array at first
    while(i < nums.size()){

      // swap the number so it become the same as the index (eg. i = 4, number = 4)
      if(nums[i] != nums[nums[i] - 1]){
        swap(nums[i], nums[nums[i] - 1]);
      } else {
        i++;
      }
    };

    // get all missing numbers
    for(int i = 0; i < nums.size(); i++){
      // because index start from 0 and the number in the array from 1
      int expected_number = i + 1; 
      
      if (expected_number != nums[i])
      {
        missing_numbers.push_back(expected_number);
      }
    }

    return missing_numbers;
  }
};

int main(int argc, char *argv[])
{
  vector<int> v1 = {2, 3, 1, 8, 2, 3, 5, 1};
  vector<int> missing = FindAllMissingNumber::Search(v1);
  cout << "Missing numbers: ";
  for (auto num : missing)
  {
    cout << num << " ";
  }
  cout << endl;

  v1 = {2, 4, 1, 2};
  missing = FindAllMissingNumber::Search(v1);
  cout << "Missing numbers: ";
  for (auto num : missing)
  {
    cout << num << " ";
  }
  cout << endl;

  v1 = {2, 3, 2, 1};
  missing = FindAllMissingNumber::Search(v1);
  cout << "Missing numbers: ";
  for (auto num : missing)
  {
    cout << num << " ";
  }
  cout << endl;
}
