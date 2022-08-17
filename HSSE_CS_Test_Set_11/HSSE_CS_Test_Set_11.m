clc
clear
m_1=0; 
m_2=0;    
m_3=0;  
m_4=0;  
m_5=0; 


m_6=0; 
m_7=0;    
m_8=0;  
m_9=0;  
m_10=0; 


m_11=0; 
m_12=0;    
m_13=0;  
m_14=0;  
m_15=0; 
m_16=0;  
m_17=0;  
m_18=0; 

All_data_Results_1 = cell(1,400);
All_data_Results_2 = cell(1,400);
All_data_Results_3 = cell(1,400);
All_data_Results_4 = cell(1,400);
All_data_Results_5 = cell(1,400);


All_data_Results_6 = cell(1,400);
All_data_Results_7 = cell(1,400);
All_data_Results_8 = cell(1,400);
All_data_Results_9 = cell(1,400);
All_data_Results_10 = cell(1,400);


All_data_Results_11 = cell(1,400);
All_data_Results_12 = cell(1,400);
All_data_Results_13 = cell(1,400);
All_data_Results_14 = cell(1,400);
All_data_Results_15 = cell(1,400);

All_data_Results_16 = cell(1,400);
All_data_Results_17 = cell(1,400);
All_data_Results_18 = cell(1,400);

for i = 7
    
ImageNum =i;

switch ImageNum
            case 1
                filename = 'barbara';
            case 2
                filename = 'boats';
            case 3
                filename = 'cameraman';
            case 4
                filename = 'fingerprint';    
            case 5
                filename = 'flinstones'; 
                
            case 6
                filename = 'foreman';
            case 7
                filename = 'house';
            case 8
                filename = 'lena256';
            case 9
                filename = 'Monarch';    
            case 10
                filename = 'Parrots'; 
                
            case 11
                filename = 'peppers256';
            
end

for j  =   1:5
    
filename
  
ratio_Num        =     [0.1, 0.2, 0.3, 0.4, 0.5]; 



IterNum             =      500;

Subrate             =       ratio_Num(j)



c1                =      1; 

c2                =      1;
             

 if  Subrate==0.1
     
     
     alpha  = 0.04;   beta = 0.0003; mu = 0.001; err_or = 5.0E-05;
     

 [Ori, Subrate, alpha, beta, mu, c1, c2, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= CS_HSSE_Test(filename, IterNum, Subrate, alpha, beta, mu, c1, c2, err_or);
 
 m_1= m_1+1;
 
 s=strcat('A',num2str(m_1));
 
 All_data_Results_1{m_1}={Ori, Subrate, alpha,  beta,  mu, c1, c2, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or};
 
 xlswrite('CS_HSSE_0.1_Test_Set_11.xls', All_data_Results_1{m_1},'sheet1',s);
 

 
 
elseif  Subrate==0.2
     
     alpha  = 0.04;   beta = 0.00008; mu = 0.003; err_or = 2.4E-05;
         
[Ori, Subrate, alpha, beta, mu, c1, c2, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= CS_HSSE_Test(filename, IterNum, Subrate, alpha, beta, mu, c1, c2, err_or);

 m_4= m_4+1;
 
 s=strcat('A',num2str(m_4));
 
 All_data_Results_4{m_4}={Ori, Subrate, alpha,  beta,  mu, c1, c2, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or};
 
 xlswrite('CS_HSSE_0.2_Test_Set_11.xls', All_data_Results_4{m_4},'sheet1',s);


 
 elseif  Subrate==0.3
     
     
          alpha  = 0.06;   beta = 0.00008; mu = 0.001; err_or = 1.8E-05;
     

[Ori, Subrate, alpha, beta, mu, c1, c2, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= CS_HSSE_Test(filename, IterNum, Subrate, alpha, beta, mu, c1, c2, err_or);

 m_7= m_7+1;
 
 s=strcat('A',num2str(m_7));
 
 All_data_Results_7{m_7}={Ori, Subrate, alpha,  beta,  mu, c1, c2, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or};
 
 xlswrite('CS_HSSE_0.3_Test_Set_11.xls', All_data_Results_7{m_7},'sheet1',s);
 

 
 
  elseif  Subrate==0.4
     
       alpha  = 0.06;   beta = 0.00008; mu = 0.003; err_or = 1.0E-05;
    
[Ori, Subrate, alpha, beta, mu, c1, c2, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= CS_HSSE_Test(filename, IterNum, Subrate, alpha, beta, mu, c1, c2, err_or);

 m_10=  m_10+1;
 
 s=strcat('A',num2str( m_10));
 
 All_data_Results_10{ m_10}={Ori, Subrate, alpha,  beta,  mu, c1, c2, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or};
 
 xlswrite('CS_HSSE_0.4_Test_Set_11.xls', All_data_Results_10{ m_10},'sheet1',s);
 

 
 
 elseif Subrate==0.5
     
     
          alpha  = 0.08;   beta = 0.00008; mu = 0.001; err_or = 1.1E-05;
     
[Ori, Subrate, alpha, beta, mu, c1, c2, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= CS_HSSE_Test(filename, IterNum, Subrate, alpha, beta, mu, c1, c2, err_or);

 m_13=  m_13+1;
 
 s=strcat('A',num2str( m_13));
 
 All_data_Results_13{ m_13}={Ori, Subrate, alpha,  beta,  mu, c1, c2, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or};
 
 xlswrite('CS_HSSE_0.5_Test_Set_11.xls', All_data_Results_13{ m_13},'sheet1',s);


 
 
 else
     
  
[Ori, Subrate, alpha, beta, mu, c1, c2, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= CS_HSSE_Test(filename, IterNum, Subrate, alpha, beta, mu, c1, c2, err_or);

 m_16=  m_16+1;
 
 s=strcat('A',num2str( m_16));
 
 All_data_Results_16{ m_16}={Ori, Subrate, alpha,  beta,  mu, c1, c2, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or};
 
 xlswrite('CS_HSSE_text_miss_Test_Set_11.xls', All_data_Results_16{ m_16},'sheet1',s);        
         
 save CS_HSSE_text_miss_Test_para  All_data_Results_16 
 

 
 end
 
  clearvars -except filename i  m_1 All_data_Results_1 m_2 All_data_Results_2 m_3 All_data_Results_3 m_4 All_data_Results_4 m_5 All_data_Results_5 ...
m_6 All_data_Results_6 m_7 All_data_Results_7 m_8 All_data_Results_8 m_9 All_data_Results_9 m_10 All_data_Results_10 m_11 All_data_Results_11 ...
m_12 All_data_Results_12 m_13 All_data_Results_13 m_14 All_data_Results_14 m_15 All_data_Results_15 m_16 All_data_Results_16 ...
m_17 All_data_Results_17 m_18 All_data_Results_18
end

 clearvars -except filename  m_1 All_data_Results_1 m_2 All_data_Results_2 m_3 All_data_Results_3 m_4 All_data_Results_4 m_5 All_data_Results_5 ...
m_6 All_data_Results_6 m_7 All_data_Results_7 m_8 All_data_Results_8 m_9 All_data_Results_9 m_10 All_data_Results_10 m_11 All_data_Results_11 ...
m_12 All_data_Results_12 m_13 All_data_Results_13 m_14 All_data_Results_14 m_15 All_data_Results_15 m_16 All_data_Results_16 ...
m_17 All_data_Results_17 m_18 All_data_Results_18
end
