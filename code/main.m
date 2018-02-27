clear all;
featurearr=zeros(100,6);
for j=1:5
    for i=1:20
        %g1(1).jpg

        str='..\dataset\g'  ;
        cat_gest = int2str(j);  % j represents the category of the gesture (from 1 to 5)
        in = int2str(i);   % i represents a sample of the gesture category. Dataset contains 20 samples for each category
        str=strcat(str,x,' (',in,').jpg');
        
        I=imread(str);

        %figure,imshow(I);
        % [r c d]=size(I);
        %I=imresize(I,.2);
        I=segment_image(I);  % calling the custom function for image segmentation
        
        arr=[feature_extract(I),j];   %concatenating the feature values with the sample category as the 6th attribute
        featurearr((j-1)*20+i,:)=arr;
    end;
end;
disp('TRAINING DATA');
disp(featurearr);
disp('TEST DATA');
test=featurearr(1:7:67,:);
disp(test);
eff=knnfunc(test,featurearr,5);   %empirically setting k = 5
disp('efficiency = ');
disp(eff);

