module ActiveScaffold
  module Helpers
    module ListColumnHelpers

      def active_scaffold_column_paperclip_link(column, record)
        return nil if record.send(column.name).nil?
        link_to( 
          record.send("#{column.name}_file_name"), 
          record.send(column.name).url, 
          :popup => true)
      end
      
      def active_scaffold_column_paperclip_thumb(column, record)
        link_to( 
          image_tag(record.send(column.name).url(:thumbnail), :border => 0), 
          record.send(column.name).url, 
          :popup => true)
      end

      def active_scaffold_column_paperclip_redbox_link(column, record)
        return nil if record.send(column.name).nil?
        #link_to_remote_redbox( 
          record.send("#{column.name}_file_name")
          #, 
          #record.send(column.name).url)
      end
      
      def active_scaffold_column_paperclip_redbox_thumb(column, record)
        thiscol = record.send(column.name)
        thumbnail_url = thiscol.url(:thumbnail)
        original_url = thiscol.url()

        link_to_remote_redbox( 
          image_tag(thumbnail_url, :border => 0), :url =>  {
          :controller=> 'document_files', :action=>'zoom',
          :id => record.id() })
          
      end


    end
  end
end
