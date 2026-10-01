import pdfplumber
import pandas as pd

def extract_pdf_data(pdf_path):
    """
    Extrae texto y tablas de un archivo PDF manteniendo la estructura base.
    """
    extracted_data = []
    
    with pdfplumber.open(pdf_path) as pdf:
        for page_num, page in enumerate(pdf.pages, start=1):
            text = page.extract_text()
            tables = page.extract_tables()
            
            extracted_data.append({
                "page": page_num,
                "text_sample": text[:200] if text else "",
                "tables_found": len(tables)
            })
            
    return extracted_data

def clean_and_export(data, output_csv="extracted_output.csv"):
    """
    Limpia y exporta los datos extraídos a un archivo CSV estructurado.
    """
    df = pd.DataFrame(data)
    df['text_sample'] = df['text_sample'].str.replace('\n', ' ')
    df.to_csv(output_csv, index=False)
    print(f"✅ Procesamiento completado exitosamente. Archivo guardado como: {output_csv}")

if __name__ == "__main__":
    sample_pdf = "sample.pdf"
    try:
        data = extract_pdf_data(sample_pdf)
        clean_and_export(data)
    except FileNotFoundError:
        print("⚠️ Coloca un archivo llamado 'sample.pdf' en el directorio para ejecutar la prueba.")
