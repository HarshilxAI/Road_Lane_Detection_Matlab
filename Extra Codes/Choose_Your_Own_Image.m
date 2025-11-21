[file , path ] = uigetfile( {'*.jpg;*.png;*.jpeg'} , 'Select road image') ;
if isequal(file , 0)
    disp( 'No image selected, exiting...' );
    return
end

imgPath = fullfile( path , file );
I   = imread( imgPath );
I_rgb = I ;
