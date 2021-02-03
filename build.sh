  }
  return result;
}
// System calls
void systemCall(string arg) {
  const char * c = arg.c_str();
  system(c);
}
// Shell Macro
#define shell(X) systemCall(X)
// Error handling Macro
#define handle(X) catch (std::invalid_argument& X)
// Type conversion
int to_int(string arg) {
  return std::stoi(arg);
}
int to_double(string arg) {
  return std::stod(arg);
}
// Numeric strings
bool is_int(string arg) {
  bool value = true;
  try {
    int num = to_int(arg);
  }
  handle(e) {
    value = false;
  }
  return value;
}
bool is_double(string arg) {
  bool value = true;
  try {
    double num = to_double(arg);
  }
  handle(e) {
    value = false;
  }
  return value;
}
bool is_bool(string arg) {
  return (arg == \"0\" || arg == \"1\");
}
int main() {
" >> main.cpp

cat main.bb >> main.cpp
echo "}" >> main.cpp

if test -f "a.out"
then
  rm a.out
fi

g++ main.cpp -flto -O -std=c++20 &>/dev/null
