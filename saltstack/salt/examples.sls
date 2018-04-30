install vim:
  pkg.installed:
    - name: vim

create my_new_directory:
 file.directory:
   - name: /opt/my_new_directory
   - user: root
   - group: root
   - mode: 755
   