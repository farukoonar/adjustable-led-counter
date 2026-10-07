# ⏱️ VHDL Configurable Frequency 16-Bit LED Counter

[TR] Harici switch girişlerine göre sayma frekansı dinamik olarak ayarlanabilen, senkron reset kontrollü 16-bit LED sayıcı tasarımı.  

### 📌 Özellikler
- **Giriş Frekansı:** 100 MHz
- **Kontrol:** Senkron Reset (`rst`), 2-bit Frekans Seçici (`sw[1:0]`)
- **Çıkış:** 16-bit LED (`led[15:0]`)
- **Frekans Modları:**
  - `sw = "00"` ➔ 2.0 Saniye
  - `sw = "01"` ➔ 1.0 Saniye
  - `sw = "10"` ➔ 500 ms
  - `sw = "11"` ➔ 250 ms

### 🔬 Simülasyon (Vivado Waveform)
Hızlı doğrulama için `c_clkfreq = 20` parametresi ile simüle edilmiştir. Switch değeri arttıkça sayıcının hızlandığı ve reset uygulandığında kararlı şekilde sıfırlandığı doğrulanmıştır.

<img width="2560" height="266" alt="image" src="https://github.com/user-attachments/assets/2981dbac-f5e7-4fdc-93fa-b71a1e129233" />

### 🎬 Donanım Doğrulaması (FPGA Demo)
Tasarım Basys 3 FPGA kartına yüklenmiş ve fiziksel donanım üzerinde test edilmiştir.

[counter.webm](https://github.com/user-attachments/assets/14ff31cd-c5de-4ef6-a5eb-e0d0ef592c96)

---
[EN] A 16-bit LED counter in VHDL with adjustable counting frequency via external switches and synchronous reset.


### 📌 Features
- **Clock Input:** 100 MHz
- **Controls:** Synchronous Reset (`rst`), 2-bit Mode Selector (`sw[1:0]`)
- **Outputs:** 16-bit LED Bus (`led[15:0]`)
- **Frequency Modes:**
  - `sw = "00"` ➔ 2.0 s
  - `sw = "01"` ➔ 1.0 s
  - `sw = "10"` ➔ 500 ms
  - `sw = "11"` ➔ 250 ms

### 🔬 Simulation Results
Verified with Vivado Simulator using `c_clkfreq = 20` for fast simulation. As switch values increment, counting frequency increases proportionally; synchronous reset behavior is also verified.

<img width="2560" height="266" alt="image" src="https://github.com/user-attachments/assets/5c369c60-2826-4d18-a585-47bd18977be2" />

### 🎬 Hardware Verification (FPGA Demo)
Implemented and verified on a Xilinx Basys 3 FPGA development board.

[counter.webm](https://github.com/user-attachments/assets/14ff31cd-c5de-4ef6-a5eb-e0d0ef592c96)

---

## 📁 Dosya Yapısı / Project Structure
- `top.vhd`: Ana RTL tasarımı / Top-level RTL module
- `tb_top.vhd`: Testbench dosyası / Testbench module
- `Basys-3-Master.xdc`: FPGA pin atamaları / Constraints file
