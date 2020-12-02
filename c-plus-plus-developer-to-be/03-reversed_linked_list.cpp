#include <iostream>
#include <vector>
#include <list>

using namespace std;

/* [main] */

int main(int argc, char *argv[])
{
  list<int> linked_list;
  vector<int> input = {1, 12, 8, 4, 72, 6};

  // push the vector to linked list
  for (int i = 0; i < input.size(); i ++){
    linked_list.push_back(input[i]);
  }

  // reversing linked_list
  linked_list.reverse();

  // visualize the result
  for (list<int>::iterator it = linked_list.begin(); it != linked_list.end(); ++it){
    cout << ' ' << *it;
  }

  cout << endl;
  return 0;
}
