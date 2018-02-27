function eff = knnfunc(test,training,k)
calclass=zeros(size(test,1),1);
correct=0;
n=5;
for i=1:size(test,1);
   arr=test(i,1:5);
   
   % disp(arr);
   arr=repmat(arr,size(training,1),1);
   arrsqr=training(:,1:5)-arr;
 
   arrsqr=power(arrsqr,2);
   arrsqr=sum(arrsqr,2);
   %disp(arrsqr);
   dist=sqrt(arrsqr);
   final=[training,dist];
    
   final=sortrows(final,7);
   cnt=zeros(1,5);
   knn=final(1:k,:);
    for j=1:k
       if(knn(j,n+1)==1)
           cnt(1)=cnt(1)+1;
       else if(knn(j,n+1)==2)
               cnt(2)=cnt(2)+1;
          else if(knn(j,n+1)==3)
                  cnt(3)=cnt(3)+1;
             else if(knn(j,n+1)==4)
                    cnt(4)=cnt(4)+1;
                else if(knn(j,n+1)==5)
                       cnt(5)=cnt(5)+1;
                    end;
                 end;
              end;
           end;
       end;
   end;
   
   
  [~,ind]=max(cnt);
  %disp(val);
  calclass(i,1)=ind;
  if(ind==test(i,6))
      correct=correct+1;
 
  end;
%            
%          plot(i,ind,'r.',i,test(i,5),'bo');  
%           axis([1 80 0 4]);
%           xlabel('test samples');
%            ylabel('class');
%           legend('Calculated class','Original class');
%           hold on;
%     

eff=correct/size(test,1)*100;
end;