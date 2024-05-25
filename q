#include <vector>
#include <stack>

using namespace std;

class NestedIterator {
public:
    NestedIterator(vector<NestedInteger> &nestedList) {
        
        for (int i = nestedList.size() - 1; i >= 0; --i) {
            stk.push(nestedList[i]);
        }
    }

    int next() {
        int result = stk.top().getInteger();
        stk.pop();
        return result;
    }

    bool hasNext() {
        while (!stk.empty()) {
            NestedInteger current = stk.top();
            if (current.isInteger()) {
                return true;
            }
            stk.pop();
            vector<NestedInteger>& nestedList = current.getList();
            for (int i = nestedList.size() - 1; i >= 0; --i) {
                stk.push(nestedList[i]);
            }
        }
        return false;
    }

private:
    stack<NestedInteger> stk;
};

