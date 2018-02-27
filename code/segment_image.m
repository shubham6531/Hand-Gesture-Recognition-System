function segment=segment_image(I)
    gray_im = rgb2gray(I); %obtaining gray scale image for segmentation through multiplication at the end of function
    I = double(I); %converting the image from int to double precision
    
    [hue,~,~]=rgb2hsv(I); %keeping hue value
    cb =  0.148* I(:,:,1) - 0.291* I(:,:,2) + 0.439 * I(:,:,3) + 128; %calculating chrominance
    cr =  0.439 * I(:,:,1) - 0.368 * I(:,:,2) -0.071 * I(:,:,3) + 128;
    [w, h]=size(I(:,:,1)); %size of image
    for i=1:w
        for j=1:h            
            if  140<=cr(i,j) && cr(i,j)<=165 && 140<=cb(i,j) && cb(i,j)<=195 && 0.01<=hue(i,j) && hue(i,j)<=0.1     
                segment(i,j)=1;            
            else       
                segment(i,j)=0;    
            end    
        end
    end

    segment = medfilt2(segment);  %segment represents the filter values for whether a pixel is black or white
    segment= bsxfun(@times, gray_im, cast(segment,'like',gray_im));   %the binary segmented image
