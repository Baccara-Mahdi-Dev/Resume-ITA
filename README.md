# 📄 EnterTheCv

This project uses **[RenderCV](https://github.com/rendercv/rendercv)** to generate professional CVs in multiple languages (Italian 🇮🇹 and English 🇬🇧).  
It provides a simple script (`render.sh`) to render the CV in the desired language from YAML templates.

---

## 📂 Project Structure

```
.
├── classic/                # Classic RenderCV theme assets
├── eng/                    # Output folder for English CV
├── ita/                    # Output folder for Italian CV
├── Baccara_Mahdi_CV.yaml   # YAML template for Italian CV
├── Mahdi_Baccara_CV.yaml   # YAML template for English CV
├── render.sh               # Script to render CVs
├── .gitignore
└── README.md
```

---

## 🎯 Purpose

- **Baccara_Mahdi_CV.yaml** → Template for the **Italian CV**  
- **Mahdi_Baccara_CV.yaml** → Template for the **English CV**  

The script `render.sh` automates the rendering process, ensuring the correct template is used and the output is placed in the right folder.

---

## ⚙️ Requirements

- [RenderCV](https://github.com/rendercv/rendercv) installed  
  ```bash
  pip install rendercv
  ```

- Bash shell (Linux, macOS, or Git Bash on Windows)

---

## 🚀 Usage

Run the script with the desired language option:

```bash
./render.sh it   # Render Italian CV
./render.sh en   # Render English CV
```

### Available Options
- `it` → Generates CV from **Baccara_Mahdi_CV.yaml** into the `ita/` folder  
- `en` → Generates CV from **Mahdi_Baccara_CV.yaml** into the `eng/` folder  

If no option is provided or an invalid one is used, the script will show an error message with available options.

---

## 🛠️ Script Overview

The `render.sh` script:

1. Checks if a language argument is provided.  
2. Selects the correct YAML template based on the argument.  
3. Runs `rendercv render` with the chosen template.  
4. Saves the output in the corresponding folder (`ita/` or `eng/`).  

Example snippet:

```bash
case $LANGUAGE in
    "it")
        rendercv render "./Baccara_Mahdi_CV.yaml" --output-folder-name "ita"
        ;;
    "en")
        rendercv render "./Mahdi_Baccara_CV.yaml" --output-folder-name "eng"
        ;;
esac
```

---

## 📌 Notes

- The **classic** and **markdown** folders contain additional RenderCV themes and formats.  
- You can customize the YAML templates to update CV content.  
- Output files (PDF, HTML, etc.) will be generated inside the language-specific folders.
- The name is inspired by the popular roguelike *Enter the Gungeon*.
 
