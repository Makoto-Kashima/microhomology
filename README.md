# 🧬 Microhomology Detection and Summary Script

This Python script detects **microhomology regions** in a **FASTA genome sequence** by identifying **reverse complement k-mers (6-10 bp)**.  
It then summarizes the distribution of detected microhomology across different fragment lengths.

---

## 📌 Features
✔ Reads a **FASTA file** and extracts the sequence of a given chromosome  
✔ Searches for **reverse complement k-mers (6-10 bp)** within a given sequence length (`maxLength = 50, 100, 150, 200`)  
✔ **Saves detected microhomology regions** as CSV files  
✔ **Summarizes microhomology coverage** over different fragment lengths  
✔ Supports **multiple `maxLength` values in a single execution**  

---

## 🛠 Installation
### 1️⃣ Clone this repository
```bash
git clone https://github.com/your-username/microhomology-detection.git
cd microhomology-detection

