#include <cassert>

int max(int a, int b) {
    if (a > b) {
        return a;
    }
    return b;
}

int main() {
    assert(max(1, 0) == 1);
    assert(max(0, 1) == 1);
}
