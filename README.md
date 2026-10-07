# ⏱️ VHDL Configurable Frequency 16-Bit LED Counter

**[TR]** Harici switch girişlerine göre sayma frekansı dinamik olarak ayarlanabilen, senkron reset kontrollü 16-bit LED sayıcı tasarımı.  
**[EN]** A 16-bit LED counter in VHDL with dynamically adjustable counting frequency via external switches and synchronous reset.

---

## 📌 Özellikler / Features

| Parametre / Parameter | Değer / Value | Açıklama / Description |
| :--- | :--- | :--- |
| **Clock Input** | 100 MHz | Dahili osilatör / On-board oscillator |
| **Reset** | `rst` | Senkron aktif-yüksek reset / Synchronous active-high |
| **Output** | `led[15:0]` | 16 adet kart üzeri LED / 16 on-board LEDs |
| **Board** | Digilent Basys 3 (xc7a35tcpg236-1) |

### 🎛️ Frekans Modları / Frequency Modes
* `sw = "00"` ➔ **2.0 s** *(0.5 Hz)*
* `sw = "01"` ➔ **1.0 s** *(1.0 Hz)*
* `sw = "10"` ➔ **500 ms** *(2.0 Hz)*
* `sw = "11"` ➔ **250 ms** *(4.0 Hz)*

---

## 🔬 Simülasyon Doğrulaması / Simulation Verification

Hızlı simülasyon amacıyla generic parametresi `c_clkfreq = 20` olarak ayarlanmış ve Vivado Simulator ile test edilmiştir. Switch değeri arttıkça sayıcının hızlandığı ve `rst` uygulandığında sayıcının kararlı şekilde sıfırlandığı doğrulanmıştır.  
*(Verified with Vivado Simulator using `c_clkfreq = 20`. Frequency increments and synchronous reset behavior are verified).*

<img width="2560" height="266" alt="Simulation Waveform" src="https://github.com/user-attachments/assets/2981dbac-f5e7-4fdc-93fa-b71a1e129233" />

---

## 🎬 Donanım Demosu / Hardware Demo

Tasarım **Basys 3** geliştirme kartına gömülmüş ve fiziksel switch/LED donanımları üzerinde test edilmiştir.  
*(Synthesized, implemented and verified on the physical Digilent Basys 3 FPGA board).*

https://github.com/user-attachments/assets/14ff31cd-c5de-4ef6-a5eb-e0d0ef592c96

---

## 📁 Dosya Yapısı / Project Structure

```text
├── constrs_1/
│   └── Basys-3-Master.xdc    # FPGA pin bağlantıları / Constraints file
├── sim_1/
│   └── tb_top.vhd            # Simülasyon testbench dosyası / Testbench module
├── sources_1/
│   └── top.vhd               # Ana RTL tasarım kodu / Top-level RTL design
└── README.md                 # Proje dokümantasyonu / Project documentation
