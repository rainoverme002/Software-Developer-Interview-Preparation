#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

class Interval {
 public:
  int start = 0;
  int end = 0;

  Interval(int start, int end) {
    this->start = start;
    this->end = end;
  }
};

class MergeIntervals {
 public:
   /* [function] Merge
    input: 
      - vector Interval intervals
    output:
      - vector Interval merge_intervals
    description:
      - Merge all the overlapping intervals
    assumption:
      - the intervals is not sorted
    example:
      vector<Interval> input = {{1, 3}, {2, 5}, {7, 9}}
      vector<Interval> output = {{1, 5}, {7, 9}}
  */
   static vector<Interval> Merge(vector<Interval> &intervals)
   {
     vector<Interval> merged_intervals;

     // sort the intervals based on the start date
     sort(intervals.begin(), intervals.end(), [](const Interval &x, Interval &y) { return x.start < y.start; });

     // define the first interval as the iterator
     vector<Interval>::const_iterator interval_iterator = intervals.begin();

     // interval = first_value in intervals
     Interval interval = *interval_iterator++;

     int start_time = interval.start;
     int end_time = interval.end;

     while (interval_iterator != intervals.end())
     {
       // get the next_value in intervals
       interval = *interval_iterator++;

       // merged the intervals if the next_interval.start() <= current_interval.end()
       if (interval.start <= end_time)
       {
         end_time = max(end_time, interval.end);
       }
       else
       {
         merged_intervals.push_back({start_time, end_time});
         start_time = interval.start;
         end_time = interval.end;
       }
     };

     // Pushed the last interval
     merged_intervals.push_back({start_time, end_time});

     return merged_intervals;
  }
};

int main(int argc, char *argv[]) {
  vector<Interval> input = {{1, 3}, {2, 5}, {7, 9}};
  cout << "Merged intervals: ";
  for (auto interval : MergeIntervals::Merge(input)) {
    cout << "[" << interval.start << "," << interval.end << "] ";
  }
  cout << endl;

  input = {{6, 7}, {2, 4}, {5, 9}};
  cout << "Merged intervals: ";
  for (auto interval : MergeIntervals::Merge(input)) {
    cout << "[" << interval.start << "," << interval.end << "] ";
  }
  cout << endl;

  input = {{1, 4}, {2, 6}, {3, 5}};
  cout << "Merged intervals: ";
  for (auto interval : MergeIntervals::Merge(input)) {
    cout << "[" << interval.start << "," << interval.end << "] ";
  }
  cout << endl;
}
