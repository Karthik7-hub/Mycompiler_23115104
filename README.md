```markdown
# ⚙️ Simple C++ Expression Compiler with Flex & Bison

This project demonstrates a **basic compiler implementation** using **Flex & Bison in C++**, capable of parsing arithmetic expressions and generating **Three Address Code** and **custom instructions** (like `MIXMUL`). 

Perfect for compiler design projects and learning purposes!


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


## 📂 Project Files

```bash
.
├── compiler.y        # Combined Bison (parser + logic)
├── lexer.l           # Flex lexer
├── Makefile          # Build configuration
├── output.asm        # Generated assembly file
├── README.md         # This file
```


## 💡 What It Does

- Parses expressions like `X = A * B + 1;`
- Generates **Three Address Code (TAC)**
- Detects optimized patterns (e.g., `A * B + 1`)
- Outputs a **custom instruction** (`MIXMUL`)
- Simulates final assembly code output

---

## 🧱 Build Instructions

### ✅ Step 1: Compile the Compiler

Open MSYS2 terminal inside your project folder and run:

```bash
make
```

### ▶️ Step 2: Run the Compiler

```bash
./mycompiler
```


## 🧪 Example Input

When prompted:

```c
X = M * N + 1;
```


## 🖨️ Sample Output

```bash
[Three Address Code]
t1 = M * N
t2 = t1 + 1
X = t2

[Optimized Instructions]
MIXMUL X = M * N + 1

[Final Code]
[Assembly Written to output.asm]
```


## 📝 Generated `output.asm`

```asm
t1 = M * N
t2 = t1 + 1
X = t2
STORE X
```


## 🙋 FAQ

**Q: Where is my output?**  
> Look for `output.asm` in the same folder.
> if any other doubts you can verify through the screenshots once.

---

## 📜 License

This project is open-source and free to use for educational and academic purposes.

---
