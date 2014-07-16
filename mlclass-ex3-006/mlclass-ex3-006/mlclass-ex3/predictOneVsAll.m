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
%Matrix'in rowlar� s' i�in bak�yoruz ��nk� 5000 adet training set eleman� var bu nedenle s=s' yap�l�yor.
%Elimizde 5000 x 10 luk matrix var. Buradaki 10 adet classifier'in
%sonu�lar�na bak�lmas� gerekli. Yani 5000 adet eleman bu 10 adet
%classifier'dan hangisinde daha fazla olas�l�k elde etmi� (sigmoid). bunu
%bulmal�y�z. Hangisi b�y�kse burada o class'a ait demektir.
% max fonksiyonu ile row'lardaki en b�y�k de�erin kendisini ve INDEX'ini d�nd�r�yoruz.
% Bu nedenle INDEX de�eri p olarak geri g�nderiliyor ki hata oran� hesaplana bilsin.
% y= pred k�sm�nda e�er e�le�en elemanlar do�ru ise 1 yanl��sa 0 d�n�yor.
% bu vekt�r�n ortalamas�n� hesaplay�p * 100 ile �arp�nca elimizdeki data ile do�ruluk hesaplan�yor.

 [C,I] = max(s',[],2);
p=I;
% =========================================================================


end
