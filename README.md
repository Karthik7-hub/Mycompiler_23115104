# Arithmetic Expression Compiler

This project is a simple compiler that takes arithmetic expressions and generates:

- ✅ Three Address Code (TAC)
- ⚙️ Optimized Custom Instructions (like `MIXMUL`, `MIXMUL_SUB`)
- 🖥️ Register-based Assembly Output

Built using **Flex** and **Bison** in C++. The compiler can detect specific patterns for optimization and simulate a register machine.

---
## 📥 Installation Guide (Windows with MSYS2)

### 🔧 Step 1: Install MSYS2 Terminal

👉 Download & install MSYS2 from the official link:  
**🔗 https://www.msys2.org/wiki/MSYS2-installation/**

Make sure to follow all steps on the site including initialization!


### 🛠️ Step 2: Open MSYS2 Terminal and Run These Commands

```bash
pacman -Su                   # Update all packages
pacman -S base-devel gcc     # Install base tools and C++ compiler
pacman -S flex bison         # Install Flex & Bison
pacman -S git                # (Optional) Version control
pacman -S cmake              # (Optional) Build tools
```


## 🛠 Build Instructions

Make sure **Flex**, **Bison**, and **g++** are installed.

```bash
make
```

It will:
- Generate the parser and lexer files
- Compile all source code
- Create an executable called `mycompiler`

---

## 🚀 How to Use

Run the program:

```bash
./mycompiler
```

You will be prompted to enter an arithmetic expression like:

```plaintext
RESULT = (X1 * Y1 + 1) + (X2 * Y2 - 1);
```

---

## ✅ Example Output

| Section | Output |
|--------|--------|
| **Input** | `RESULT = (X1 * Y1 + 1) + (X2 * Y2 - 1);` |
| **Three Address Code** | `t1 = X1 * Y1`<br>`t2 = 1`<br>`t3 = t1 + t2`<br>`t4 = X2 * Y2`<br>`t5 = 1`<br>`t6 = t4 - t5`<br>`t7 = t3 + t6`<br>`RESULT = t7` |
| **Optimized Instructions** | `MIXMUL R5 = t1 + t2`<br>`MIXMUL_SUB R10 = t4 - t5` |
| **Assembly Code** | `MOV R1, X1`<br>`MOV R2, Y1`<br>`MUL R3, R1, R2`<br>`MOV R4, 1`<br>`ADD R5, R3, R4`<br>`MOV R6, X2`<br>`MOV R7, Y2`<br>`MUL R8, R6, R7`<br>`MOV R9, 1`<br>`SUB R10, R8, R9`<br>`MOV R11, R5`<br>`ADD R11, R11, R10`<br>`STORE RESULT, R11` |

Assembly is also saved to `output.asm`.

---

## 📁 Project Structure

```
.
├── lexer.l         # Lexer (Flex)
├── parser.y        # Parser + Code Gen (Bison)
├── main.cpp        # Entry point
├── Makefile        # Build script
├── output.asm      # Assembly output
└── README.md       # You're here!
```

---

## ⚙️ Optimization Details

| Pattern | Recognized As |
|--------|----------------|
| `X * Y + 1` | `MIXMUL` |
| `X * Y - 1` | `MIXMUL_SUB` |

These patterns are recognized during parsing and mapped to custom pseudo-instructions.

---
## 📸 Screenshots
![Screenshot 2025-04-06 135048](https://github.com/user-attachments/assets/5efc9f64-25fd-4a2a-9691-9985dedfd36e)
![Screenshot 2025-04-06 135057](https://github.com/user-attachments/assets/c27dd295-0a63-415a-aedb-95f7201376ad)

The above to are the of two examples
---

## 📜 License

MIT License – feel free to use, modify, and enhance.

---


