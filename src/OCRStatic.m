classdef OCRStatic
   methods (Static)
      function out = setGetOCRArchitecture(data)
         persistent arch;
         if nargin
            arch = data;
         end
         out = arch;
      end

      function out = setGetFilterPath(data)
         persistent path;
         if nargin
            path = data;
         end
         out = path;
      end

      function out = setGetClassifierPath(data)
         persistent path;
         if nargin
            path = data;
         end
         out = path;
      end
   end
end