# Boomer-BASIC

BoomerBASIC is an [esolang](https://en.wikipedia.org/wiki/Esoteric_programming_language) implemented in a single bash script.

According to Wikipedia, an esolang is

>...a programming language designed to test the boundaries of computer programming language design, as a proof of concept, as software art, as a hacking interface to another language (particularly functional programming or procedural programming languages), or as a joke. The use of 'esoteric' distinguishes these languages from programming languages that working developers use to write software.

## Getting Started

1. Use a 'nix' operating system. Either on bare metal or some form of virtual machine.
2. Optionally, set Bash aliases for 'sh build.sh' and './a.out'.
3. Make 'build.sh' executable.
4. Optionally, transfer ownership of the script from root to the normal user to avoid any rigmarole with 'sudo', 'doas', etc.
5. Create a 'main.bb' source file. The 'hello world' program in BoomerBASIC is as follows.

```
print("Okay Boomer");
```

6. Compile your BoomerBASIC code by running the bash script.
7. Successful compilation will trigger the following message.

```
Well done, Boomer! Time to run your binary?
```

8. Any syntax error will cause compilation to fail and trigger the following message.

```
Okay Boomer. Edit your code and try again?
```

9. Lather, rinse, repeat.

## A build script LARPing as a programming language

Since this implementation of BoomerBASIC is effectively a C++ build script, existing [C++ reserved keywords](https://www.w3schools.in/cplusplus-tutorial/keywords/) may not be redefined in BoomerBASIC source code without generating an error.

## BoomerBASIC Example Snippets

### Print and input

This is a pretty straightforward and intuitive snippet, but note that the 'print' function will only accept a single argument.

```
string name = "";
print("what is your name?");
input(name);
string greeting = "hello " + name + "!";
print(greeting);
```

### Labelled code blocks and the goto command

Try the following code snippet, which illustrates the kind of infinite loop that kids used to create in BASIC on their home computers in the 1980s.

However, rather than numbered lines, BoomerBASIC uses labels that terminate with with a colon.

```
start:
print("BoomerBASIC Rules!");
goto start;
```

### The 'stop' command

The 'stop' command is another throwback to 1980s BASIC dialects.

```
print("Hello World");
stop;

print("This line is not executed");
```

### Comments, 'if', 'else if', and 'else'

Apart from the 'print' command, this code snippet works the same way that it would in C++.

However, its worth noting that in BoomerBASIC, single line comments have to go at the top of code blocks to avoid an error, but multi-comments do not have this restriction.

```
// Single line comments must be at the top
int age = 70;
if (age < 25) {
  print("Okay Zoomer");
}
else if (age < 45) {
  print("Okay Millenial");
}
else if (age < 65) {
  print("Okay Gen X");
}
else {
  print("Okay Boomer");
}
/* Multi-line comments can go top or bottom */
```

### The 'while' command

Aside from 'print', this snippet is an exact clone of C++.

```
int i = 0;
while (i < 5) {
  print(i);
  i++;
}
```

### The 'loop' shorthand

Standard C++ 'for' loops are rather verbose. While you can still use them in
BoomerBASIC, there is a shorthand available.

```
loop(i, 5) {
  print(i);
}
```

### Type conversion

This snippet demonstrates the conversion of data types in BoomerBASIC.

```
// Convert a string to an int
int num1 = to_int("365");
print(num1);

// Convert a string to a double
double num2 = to_double("3.65");
print(num2);

// Convert an int to a string
string str1 = to_string(365);
print(str1);

// Convert a double to a string
string str2 = to_string(3.65);
print(str2);
```

### The 'shell' command

While the 'system' command in C/C++ takes a null-terminated char array as its parameter, the BoomerBASIC 'shell' command works with a string object.

```
// This command plays a Hall & Oates song with vlc media player
shell("nvlc out-of-touch.mp3");
```

To clear the screen on 'nix' operating systems, we can use this command.

```
shell("clear");
```

### The 'seed' and 'random' commands

This snippet seeds the pseudo-random number generator, and outputs five random numbers between 1 and 20.

```
seed;
int num;
loop(i, 5) {
  num = random(20);
  print(num);
}
```

### Procs with no parameters

This code snippet defines a procedure with no parameters that counts down from 10 to 1.

Then calls it. Don't forget the semi-colon after the proc definition!

```
// Define proc
def liftoff proc() {
  int count = 10;
  while (count > 0) {
    print(count);
    count--;
  }
};

// Call proc
liftoff();
```

### Procs with one parameter

This version of the 'say_hi' proc does not have a return value.

```
// Define proc
def say_hi proc(string arg) {
  string greet = "Oh. Hi  " + arg;
  print(greet);
};

// Call proc
say_hi("Mark");
```

While this version does.

```
// Define proc
def say_hi proc(string arg) {
  return ("Oh. Hi " + arg);
};

// Call proc
string result = say_hi("Mark");
print(result);
```

## Enabling C++ compiler errors

To enable C++ compiler errors, then simply remove 

```
&>/dev/null
```

from the compilation step in the build script.

## To use more than one .bb file in your build

Find the following line in the build script.

```
cat main.bb >> main.cpp
```

To add an additional .bb file to your build, insert another line with the same syntax immediately above it, like so.

```
cat moar.bb >> main.cpp
cat main.bb >> main.cpp
```

Repeat this step for each new source file and remember that the order in which those files appear matters just as much in BoomerBASIC as it does in normie programming languages.

## BoomerBASIC Makefiles

Are you kidding me?

If your BoomerBASIC project becomes so large that you need to split your compilation to selectively recompile only small parts of the project, then you might want to switch to conventional C++?

## Can I use feature X from C++ in BoomerBASIC?

I dunno. Try it?

## Safely editing the C++ in the build script

The 'standard library' of BoomerBASIC may be extended or changed by editing the block of C++ in the build script. But don't forget to place a back-slash escape character before EVERY occurence of the double-quote symbol in the C++ code or it will break!
