class UIImage
  class << self
    def sugarcube568_imageNamed(name)
      main_screen = UIScreen.mainScreen
      taller_image_ext = "-#{main_screen.bounds.size.height.to_i}h@#{main_screen.scale.to_i}x"

      if (taller_image_ext && name.length > 0 && name.rangeOfString(taller_image_ext).location == NSNotFound)
        # Check if is there a path extension or not
        test_name = name
        if test_name.pathExtension.length > 0
          test_name = test_name.stringByDeletingPathExtension.stringByAppendingString(taller_image_ext).stringByAppendingPathExtension(name.pathExtension)
        else
          test_name = test_name.stringByAppendingString(taller_image_ext)
        end

        return imageNamed_old(test_name)
      end

      return nil
    end

    alias :imageNamed_old :imageNamed
    # now we've got sugarcube568_imageNamed and imageNamed_old to load the respective versions

    def imageNamed(name)
      sugarcube568_imageNamed(name) || imageNamed_old(name)
    end
  end
end
