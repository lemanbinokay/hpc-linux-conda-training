# HPC Linux Conda Training

Bu repository, biyoinformatik analizlerde kullanılan HPC (High Performance Computing) sistemlerinin temel kullanımını öğretmek amacıyla hazırlanmıştır.

---

## Genel Akış

Bu eğitimde aşağıdaki mantık adım adım öğretilir:

Linux → Dosya yönetimi → Conda → Tool kurulumu → Script yazımı → HPC → SLURM

---

## Linux Temelleri

Linux, HPC sistemlerinin temelidir. Tüm işlemler terminal üzerinden yapılır.

### Dizin (klasör) komutları

pwd  
→ bulunduğun dizini gösterir

ls  
→ bulunduğun klasördeki dosyaları listeler

ls -lh  
→ dosya boyutlarıyla birlikte listeler

cd klasor_adi  
→ klasöre girer

cd ..  
→ bir üst klasöre çıkar

cd ~  
→ home dizinine gider

---

### Dosya işlemleri

mkdir klasor_adi  
→ yeni klasör oluşturur

mkdir -p a/b/c  
→ iç içe klasör oluşturur

touch dosya.txt  
→ boş dosya oluşturur

cp dosya1.txt dosya2.txt  
→ dosya kopyalar

mv dosya.txt yeni_isim.txt  
→ dosya taşır veya yeniden adlandırır

rm dosya.txt  
→ dosya siler

rm -r klasor  
→ klasörü siler

---

### Dosya içeriği

cat dosya.txt  
→ dosyanın tamamını gösterir

head dosya.txt  
→ ilk satırları gösterir

tail dosya.txt  
→ son satırları gösterir

wc -l dosya.txt  
→ satır sayısını verir

---

### Komut zincirleme

|  
→ bir komutun çıktısını diğerine verir

örnek:  
cat dosya.txt | wc -l  

---

## Conda Nedir?

Conda, yazılım ortamlarını yönetmek için kullanılan bir sistemdir.

Farklı projelerde farklı tool ve versiyonları izole şekilde kullanmak.

---

### Conda ortamları

conda env list  
→ mevcut ortamları listeler

conda create -n env_adi  
→ yeni ortam oluşturur

conda activate env_adi  
→ ortamı aktif eder

conda deactivate  
→ ortamdan çıkar

---

### Paket kurulumu

conda install paket_adi  

biyoinformatik tool için:

conda install -c bioconda seqkit  

---

### Neden Conda?

- her proje için ayrı ortam  
- versiyon çakışması olmaz  
- reproducibility sağlar  

---

## Tool Kullanımı

Örnek tool: seqkit

seqkit stats data/example.fasta  

Bu komut FASTA dosyası hakkında özet bilgi verir.

---

## Bash Script Nedir?

Tek tek komut yazmak yerine, bir dosya içine yazıp otomatik çalıştırmayı sağlar.

örnek:

#!/bin/bash  
echo "Hello"  

çalıştırmak için:

bash script.sh  

---

## Loop (Döngü)

Birden fazla dosyada aynı işlemi yapmak için kullanılır.

örnek:

for file in data/*.fasta  
do  
  echo $file  
done  

---

## HPC Nedir?

HPC (High Performance Computing), büyük hesaplamaların güçlü bilgisayar kümelerinde yapılmasını sağlar.

HPC’de iki önemli kavram vardır:

Login node  
→ kullanıcı giriş yaptığı yer  
→ küçük işler yapılır  

Compute node  
→ asıl hesaplama burada yapılır  
→ job gönderilir  

---

## SLURM Nedir?

SLURM, HPC sistemlerinde job yönetimi yapan bir scheduler’dır.

Kullanıcı doğrudan hesaplama yapmaz; işi SLURM’a verir.

---

## SLURM Job Mantığı

Normal çalıştırma:

bash script.sh  
→ login node’da çalışır

HPC çalıştırma:

sbatch script.sh  
→ job scheduler’a gönderilir  
→ compute node’da çalışır  

---

## SLURM Script Yapısı

#!/bin/bash  
#SBATCH --job-name=job_adi  
#SBATCH --output=output.txt  
#SBATCH --error=error.txt  
#SBATCH --time=00:05:00  
#SBATCH --cpus-per-task=1  
#SBATCH --mem=1G  

Bu satırlar job’un kaynaklarını belirler.

---

## SLURM Komutları

sbatch script.sh  
→ job gönderir

squeue  
→ çalışan jobları gösterir

squeue -u $USER  
→ kendi joblarını gösterir

scancel JOB_ID  
→ job iptal eder

---

## Çıktı Dosyaları

SLURM çalıştırınca şu dosyalar oluşur:

results/slurm_JOBID.out  
results/slurm_JOBID.err  

---

## Önemli Fark

bash script.sh  
→ lokal çalıştırma  

sbatch script.sh  
→ HPC çalıştırma  
