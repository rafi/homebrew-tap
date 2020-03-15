class Uthash < Formula
  desc "C macros for hash tables"
  homepage "https://github.com/troydhanson/uthash"
  head "https://github.com/troydhanson/uthash.git"
  url "https://github.com/troydhanson/uthash.git",
      :tag => "v2.1.0",
      :revision => "8b214aefcb81df86a7e5e0d4fa20e59a6c18bc02"

  def install
    include.install Dir["src/*.h"]
  end

  def test
    (testpath/"test.c").write <<~EOS
      #include <stdlib.h>
      #include "uthash.h"

      struct my_struct {
          int id;
          char name[10];
          UT_hash_handle hh;
      };

      struct my_struct *users = NULL;

      int main(void) {
        struct my_struct *s;
        s = (struct my_struct *)malloc(sizeof *s);
        s->id = 123;
        HASH_ADD_INT(users, id, s);
        HASH_DEL(users, s);
        free(s);
        return 0;
      }
    EOS

    system ENV.cc, "-I#{include}", "test.c", "-o", "test"
    system "./test"
  end
end
