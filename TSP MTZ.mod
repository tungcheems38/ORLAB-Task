/*********************************************
 * OPL 22.1.1.0 Model
 * Author: Asus
 * Creation Date: Mar 23, 2024 at 12:16:29 PM
 *********************************************/
int n=...; // Khai bao so luong nodes
int d[1..n, 1..n]= ...;// Mang hai chieu luu tru khoang cach
dvar boolean x[1..n, 1..n]; // Bien quyet dinh luu tru gia tri True/ False
dvar float+ u[1..n]; // Bien quyet dinh luu tru thu tu cua thanh pho di qua. Thanh pho i co gia tri la k tuc la se la thanh pho thu k trong tour va thu i trong quy uoc ban dau.

//Ham muc tieu
minimize sum (i in 1..n) sum (j in 1..n) d[i,j] * x[i,j]; // Tong khoang cach ngan nhat
// Rang buoc
subject to {
 forall (j in 1..n) {sum (i in 1..n) (x[i,j]) == 1; }; // Moi nut deu co ket noi di vao
 forall (i in 1..n) {sum (j in 1..n) (x[i,j]) == 1; }; // Moi nut deu co ket noi di ra
 forall (i,j in 1..n: j!=1 && i!=1) {u[i] - u[j] + 1 <= (n-1)*(1-x[i,j]);};
};
tuple TakeSolutionT {
  int step;
  int city;
}

{TakeSolutionT} TakeSolution = {<step, j> | step in 1..N, j in 1..N: x[step,j] == 1};

execute {
  writeln(TakeSolution);
}  