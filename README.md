First install MSYS2 terminal in the sysstem
https://www.msys2.org/wiki/MSYS2-installation/
Use this link to install the terminal

After the installation
Follow these commands
   pacman -Su
   pacman -S base-devel gcc
   pacman -S flex bison
   pacman -S git
   pacman -S cmake
___________________________After the Set Up of Terminal_______________________________________
**`README.md`** tailored for the **single-file C++ compiler project** using **Flex & Bison**, ready to upload to GitHub:


# 🛠️ Simple C++ Compiler using Flex & Bison

This project is a basic **expression compiler** built in **C++ using Flex and Bison**, supporting custom instruction generation such as `MIXMUL`. It simulates the key stages of a compiler: tokenization, parsing, intermediate code generation (Three Address Code), and simple optimization.

---

## 📂 Project Structure

```
.
├── compiler.y        # Bison file (parser + main + semantic actions)
├── lexer.l           # Flex file (lexer)
├── Makefile          # Build instructions
├── output.asm        # Final simulated assembly output
├── README.md         # You're reading it!
```

---

## 🚀 Features

- ✅ Lexical analysis using **Flex**
- ✅ Parsing expressions with **Bison**
- ✅ Generates **Three Address Code (TAC)**
- ✅ Detects patterns like `A * B + 1` and outputs custom instruction: `MIXMUL`
- ✅ Writes final simulated assembly to `output.asm`

---

## 📥 Example Input

```c
X = M * N + 1;
```

### 💻 Compiler Output

```
[Three Address Code]
t1 = M * N
t2 = t1 + 1
X = t2

[Optimized Instructions]
MIXMUL X = M * N + 1

[Final Code]
[Assembly Written to output.asm]
```

---

## 🏗️ How to Build & Run

### ⚙️ Requirements
- A C++ compiler (`g++`)
- `flex` and `bison` installed
- Linux/MacOS or Windows with **MSYS2**/MinGW

### 🔧 Build

In terminal:

```bash
make
```

### ▶️ Run

```bash
./mycompiler
```

Then input a statement like:

```c
X = M * N + 1;
```

---

## 💡 How It Works

- **Flex** reads the input and breaks it into tokens (identifiers, numbers, operators).
- **Bison** parses the expression grammar and uses embedded C++ actions to:
  - Build **three-address code**
  - Detect if an expression matches a pattern like `A * B + 1`
  - Print a **custom instruction** like `MIXMUL`
  - Write the output to `output.asm`

---

## 📝 Sample `output.asm`

```asm
t1 = M * N
t2 = t1 + 1
X = t2
STORE X
```

---

## 🧾 License

Free to use and modify for learning or academic purposes.
```

---

Let me know if you want this converted into a GitHub README with badges, or styled for a class/assignment submission!
