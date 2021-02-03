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
You made a typo there hun. Edit your code and try again?
```

9. Later, rinse, repeat.

## A build script LARPing as a programming language

Since this implementation of BoomerBASIC is effectively C++ running exclusively inside the main function, existing [C++ reserved keywords](https://www.w3schools.in/cplusplus-tutorial/keywords/) may not be redefined without generating an error.

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

### The 'shell' command

While the 'system' command in C/C++ takes a null-terminated char array as its parameter, the BoomerBASIC 'shell' command works with a string object.

```
// This command plays a Hall & Oates song with vlc media player
shell("nvlc out-of-touch.mp3");
```

To clear the screen on *nix operating systems, we can use this command.

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

### User-defined functions with no parameters

This code snippet defines a function with no parameters that counts down from 10 to 1.

Then calls it. Don't forget the semi-colon after the function definition!

```
// Define function
def liftoff = fn() {
  int count = 10;
  while (count > 0) {
    print(count);
    count--;
  }
};

// Call function
liftoff();
```

### User defined functions with one parameter

Yo yo yo. Try this.

```
// Define function
def say_it_thrice = fn(string stuff) {
  loop(i, 3) {
    print(stuff);
  }
};

// Call function
say_it_thrice("yo ");
```

### User defined functions with multiple parameter?

For more than one parameter, we have to step out of BoomerBASIC and edit the chunk of C++ in the build script.

At that point, you have effectively made your own fork of BoomerBASIC with your own "standard library".

But remember that when we do that, we must put an 'escape character' backslash before every double-quote symbol for your amended build script to compile.

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
