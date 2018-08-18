
    text_file = 'C:\Users\Rashed\Desktop\Data\MatlabProgrammes\MatlabNew\PPG_Data_cs\Data File\0_subject\'
    text_tail = '%d_3.txt'
    
    %type test subject number
    counter = 3
    
    str = sprintf(text_tail,counter)
    
    s = strcat(text_file,str)
    display(s)
    fileID = fopen(s,'r')

    formatSpec = '%f';

    sizeA = [1 Inf];
    
    if exist(s, 'file')
        
        t3_3 = fscanf(fileID,formatSpec,sizeA)
        fclose(fileID);
        
    else 
        display(" Text file Not found")
    end