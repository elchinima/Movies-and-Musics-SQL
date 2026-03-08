# 🎬 Movie Database SQL Layihəsi

Bu layihə `Movie` adlı film məlumat bazasını yaratmaq üçün hazırlanmışdır. Burada rejissorlar, janrlar, aktyorlar və filmlərin özləri ilə əlaqəli cədvəllər mövcuddur. Layihə həmçinin əlaqəli (relational) cədvəlləri və nümunə dataları da əhatə edir.  

---

## 🗂️ Cədvəllər

1. **Directors** – Rejissorlar haqqında məlumatları saxlayır  
   - `DirectorId` – unikal ID  
   - `DirectorName` – rejissorun adı  
   - `DirectorAge` – yaş  

2. **Genres** – Film janrlarını saxlayır  
   - `GenreId` – unikal ID  
   - `GenreName` – janr adı  

3. **Actors** – Aktyorlar haqqında məlumat  
   - `ActorId` – unikal ID  
   - `ActorName` – aktyorun adı  

4. **Movies** – Filmlər haqqında əsas məlumat  
   - `MovieId` – unikal ID  
   - `MovieName` – film adı  
   - `DirectorId` – rejissor ID-si (foreign key)  
   - `IMDB_Point` – IMDB balı  
   - `Duration` – film müddəti dəqiqə ilə  

5. **MovieActor** – Filmlərin aktyorlarla əlaqəsi (many-to-many)  
6. **MovieGenre** – Filmlərin janrlarla əlaqəsi (many-to-many)  

---

## 📝 Nümunə Datalar

### Rejissorlar
- Christopher Nolan, 52  
- Quentin Tarantino, 60  
- Steven Spielberg, 77  

### Janrlar
- Action  
- Drama  
- Thriller  

### Aktyorlar
- Christian Bale  
- Heath Ledger  
- Morgan Freeman  

### Filmlər
- The Dark Knight – 9.0 IMDB, 152 dəq  
- Inglourious Basterds – 8.3 IMDB, 153 dəq  
- Schindler's List – 8.9 IMDB, 195 dəq  

---

## 🔗 Əlaqələr

- `Movies.DirectorId` → `Directors.DirectorId`  
- `MovieActor.MovieId` → `Movies.MovieId`  
- `MovieActor.ActorId` → `Actors.ActorId`  
- `MovieGenre.MovieId` → `Movies.MovieId`  
- `MovieGenre.GenreId` → `Genres.GenreId`  

---

## 🔍 Sorğular (Queries)

1. IMDB balı 6-dan yuxarı olan filmlərin siyahısı  
2. Adında “a” hərfi olan janrların filmləri  
3. Adı 10 simvoldan uzun olan və son hərfi “t” ilə bitən filmlər  
4. Orta IMDB balından yuxarı olan filmlərin tam məlumatı  