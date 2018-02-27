function feature_arr= feature_extract(I)
    feature_arr=zeros(1,5);
    
    I2 = im2double(I);
    feature_arr(1,5)=mean2(I);
    feature_arr(1,1)=std2(I);
    feature_arr(1,2)=nanmean(skewness(I2));
    feature_arr(1,3)=entropy(I);
    feature_arr(1,4)=nanmean(kurtosis(I2));

    %disp('kurtosis'); disp(kurtosis(I2));
    %disp('skewness'); disp(skewness(I2));


