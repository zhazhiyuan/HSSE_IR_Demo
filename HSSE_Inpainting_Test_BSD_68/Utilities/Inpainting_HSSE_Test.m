function  [filename, p_miss, alpha, beta, mu,  c1, c2, j, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= Inpainting_HSSE_Test(filename, IterNum, p_miss, alpha,beta, mu,c1, c2,err_or )


        time0                       =              clock;
        
        Orgname                     =              [filename '.png'];
        
        x_rgb                       =              imread(Orgname); 
       
        [ww, hh,kkk]                =               size(x_rgb);
        
        x_rgb                       =                imresize (x_rgb, [ww-1, hh-1]);           
          
       if kkk==3
        
        x_yuv                       =             rgb2ycbcr(x_rgb);
         
        x                           =             double(x_yuv(:,:,1)); 
        
        x_inpaint_re                =             zeros(size(x_yuv));
        
        x_inpaint_re(:,:,2)         =             x_yuv(:,:,2); 
        
        x_inpaint_re(:,:,3)         =             x_yuv(:,:,3); 
        
       else
            x                       =             double(x_rgb);
       end
         
         
         x_org                      =             x;
        
        
        ratio                       =             p_miss; 

        if ratio==0.6  %text mask
            
            MaskType                =            2; 
            
        else
            
            MaskType                =            1; % random mask; 
            
        end
        
        switch MaskType
            
            case 1  %random mask;
                
                rand('seed',0);
                
                O = double(rand(size(x)) > (1-ratio));
                
            case 2  %text mask
                
                O = imread('TextMask256.png');
                
                O = double(O>128);
                
        end
        
        y                        =                           x.* O;  % Observed Image
        
        
       Opts                   =                           [];

       if ~isfield(Opts,'alpha') 
           
             Opts.alpha = alpha;
             
       end
       
       if ~isfield(Opts,'beta') 
           
             Opts.beta = beta;
             
       end
       
       if ~isfield(Opts,'mu') 
           
             Opts.mu = mu;
             
       end  
       
       if ~isfield(Opts,'c1') 
           
             Opts.c1 = c1;
             
       end
       
       if ~isfield(Opts,'c2') 
           
             Opts.c2 = c2;
             
       end       

       if ~isfield(Opts,'A')
           
            Opts.A = O;
            
       end

       if ~isfield(Opts,'IterNums')
           
            Opts.IterNums = IterNum;
            
       end

       if ~isfield(Opts,'initial')
           
            Opts.initial = Interpolation_Initial(y,~O);
            
       end

       if ~isfield(Opts,'org')
           
            Opts.org = x_org;
            
       end

       if ~isfield(Opts,'patch')
           
            Opts.patch = 7;
            
       end

       if ~isfield(Opts,'Region')
           
            Opts.Region = 25;
            
       end

       if ~isfield(Opts,'Sim')
           
            Opts.Sim = 60;
            
       end

       if ~isfield(Opts,'step')
           
           Opts.step = 4;
           
       end

      if ~isfield(Opts,'sigma')
          
           Opts.nSig = sqrt(2);
           
      end
      
      if ~isfield(Opts,'paraell')
          
           Opts.paraell = 1;
           
      end      
      


      fprintf('.........................................\n');

     fprintf(filename);
     
     fprintf('\n');
     
     fprintf('..........................................\n');
     
     if ratio==0.6
         
     fprintf('..................HSSE Algorithm for text removal.............\n');
     
     else
         
     fprintf('..............HSSE Algorithm for random missing pixels.....   ratio = %f\n',ratio);
     
     end
      
     fprintf('..................................................\n');
     
     
     
 % if Opts.paraell % if parfor is enabled, start parpool in advance
 %     mycluster = parcluster('local');
 %     delete(gcp('nocreate')); % delete current parpool
 
%      poolobj = parpool(mycluster, mycluster.NumWorkers);      
%  end
     
     
     [reconstructed_image, PSNR_Final,FSIM_Final,SSIM_Final, All_PSNR,j, Err_or] = Inpainting_HSSE_Main(y,Opts, err_or);
     
      Time_s                         =                 (etime(clock,time0)); 
      
%   delete(poolobj); % delete pool object
   
        if kkk==3
            
        x_inpaint_re(:,:,1)         =                  uint8(reconstructed_image);
        
        x_inpainting_recon          =                  ycbcr2rgb(uint8(x_inpaint_re));
        
        else     
        x_inpainting_recon          =                  reconstructed_image;
        
        end
        
        
        if ratio==0.1
            
         Final_Name= strcat(filename,'_HSSE_BSD_68_miss_',num2str(1-ratio), '_PSNR_',num2str(PSNR_Final), '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');
            
        imwrite(uint8(x_inpainting_recon),strcat('./90_Missing_Results/',Final_Name));
        
        elseif ratio==0.2
            
         Final_Name= strcat(filename,'_HSSE_BSD_68_miss_',num2str(1-ratio), '_PSNR_',num2str(PSNR_Final), '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');
         
         
        imwrite(uint8(x_inpainting_recon),strcat('./80_Missing_Results/',Final_Name));
        
      %   Final_Name1= strcat(filename,'_GSR_WNNM_0.2_','_Iter_',num2str(j),'_PSNR_',num2str(PSN_Result),'_FSIM_',num2str(FSIM_Result),'.txt');
      %   Final_Name2= strcat(filename,'_GSR_WNNM_0.2_','_Iter_',num2str(j),'_PSNR_',num2str(PSN_Result),'_FSIM_',num2str(FSIM_Result),'.xls');
      %  dlmwrite(Final_Name1,All_PSNR);
      %  dlmwrite(Final_Name2,All_PSNR);
        elseif ratio==0.3
            
            Final_Name= strcat(filename,'_HSSE_BSD_68_miss_',num2str(1-ratio), '_PSNR_',num2str(PSNR_Final), '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');
            
            
        imwrite(uint8(x_inpainting_recon),strcat('./70_Missing_Results/',Final_Name));

        elseif ratio==0.4
            
                  Final_Name= strcat(filename,'_HSSE_BSD_68_miss_',num2str(1-ratio), '_PSNR_',num2str(PSNR_Final), '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');
            
         
        imwrite(uint8(x_inpainting_recon),strcat('./60_Missing_Results/',Final_Name));
        
        elseif ratio==0.5
            
            
             Final_Name= strcat(filename,'_HSSE_BSD_68_miss_',num2str(1-ratio), '_PSNR_',num2str(PSNR_Final), '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');
             
             
        imwrite(uint8(x_inpainting_recon),strcat('./50_Missing_Results/',Final_Name));
                
        else
            
                Final_Name= strcat(filename,'_HSSE_BSD_68_miss_',num2str(1-ratio), '_PSNR_',num2str(PSNR_Final), '_FSIM_',num2str(FSIM_Final), '_SSIM_',num2str(SSIM_Final),'.png');
         
        imwrite(uint8(x_inpainting_recon),strcat('./Text_Inlayed_Results/',Final_Name));
                                
        end           

end

