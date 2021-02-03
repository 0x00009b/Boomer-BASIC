#!/bin/bash

echo "
// Useful headers
#include <cstdlib>
#include <cstdio>
#include <ctime>
#include <cmath>
#include <climits>
#include <iostream>
#include <fstream>
#include <sstream>
#include <numeric>
#include <string>
#include <regex>
#include <limits>
#include <vector>
#include <functional>
#include <stdexcept>

// Useful declarations
using std::stringstream;
using std::ostringstream;
using std::regex_match;
using std::regex;
using std::ofstream;
using std::ifstream;
using std::isdigit;
using std::string;
using std::vector;
using std::cerr;
using std::system;
using std::string;

// Def Macro
#define def auto

// Fn Macro
#define fn(X) [](X)

// Loop Macro
#define loop(X, Y) for(int X = 0; X < Y; X++)

// Input Macro
#define input(X) std::cout << \"> \"; std::getline(std::cin, X)

// Print Macro
#define print(X) std::cout << X << std::endl

// Stop Macro
#define stop return 0

// Seed Macro
#define seed srand((int)time(0))

// Random function
int random(int arg) {
  int result = 0;
  if (arg > 1) {
    result = (rand() % arg) + 1;    
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

string to_string(int arg) {
  return std::to_string(arg);
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
    int num = to_double(arg);
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

if test -f "a.out"
then
  echo
  echo "Well done, Boomer! Time to run your binary?"
  echo
  rm main.cpp
else
  echo
  echo "You made a mistake there Boomer. Edit your code and try again?"
  echo
  rm main.cpp
fi