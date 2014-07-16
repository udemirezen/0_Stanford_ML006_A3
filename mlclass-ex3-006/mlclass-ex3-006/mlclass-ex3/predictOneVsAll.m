function p = predictOneVsAll(all_theta, X)
%PREDICT Predict the label for a trained one-vs-all classifier. The labels 
%are in the range 1..K, where K = size(all_theta, 1). 
%  p = PREDICTONEVSALL(all_theta, X) will return a vector of predictions
%  for each example in the matrix X. Note that X contains the examples in
%  rows. all_theta is a matrix where the i-th row is a trained logistic
%  regression theta vector for the i-th class. You should set p to a vector
%  of values from 1..K (e.g., p = [1; 3; 1; 2] predicts classes 1, 3, 1, 2
%  for 4 examples) 

m = size(X, 1);
num_labels = size(all_theta, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters (one-vs-all).
%               You should set p to a vector of predictions (from 1 to
%               num_labels).
%
% Hint: This code can be done all vectorized using the max function.
%       In particular, the max function can also return the index of the 
%       max element, for more information see 'help max'. If your examples 
%       are in rows, then, you can use max(A, [], 2) to obtain the max 
%       for each row.
%       

for i=1:1:num_labels
s(i,:) = sigmoid(all_theta(i,:)*X');
end
%Matrix'in rowlarý s' için bakýyoruz çünkü 5000 adet training set elemaný var bu nedenle s=s' yapýlýyor.
%Elimizde 5000 x 10 luk matrix var. Buradaki 10 adet classifier'in
%sonuçlarýna bakýlmasý gerekli. Yani 5000 adet eleman bu 10 adet
%classifier'dan hangisinde daha fazla olasýlýk elde etmiþ (sigmoid). bunu
%bulmalýyýz. Hangisi büyükse burada o class'a ait demektir.
% max fonksiyonu ile row'lardaki en büyük deðerin kendisini ve INDEX'ini döndürüyoruz.
% Bu nedenle INDEX deðeri p olarak geri gönderiliyor ki hata oraný hesaplana bilsin.
% y= pred kýsmýnda eðer eþleþen elemanlar doðru ise 1 yanlýþsa 0 dönüyor.
% bu vektörün ortalamasýný hesaplayýp * 100 ile çarpýnca elimizdeki data ile doðruluk hesaplanýyor.

 [C,I] = max(s',[],2);
p=I;
% =========================================================================


end
