(in-package :weblocks-examples-tests)

(def-test-suite weblocks-examples-tests)

(defun add-user ()
  (do-click-and-wait "css=[name='add']:nth-child(1)")
  (do-type "name=name" "Test user")
  (do-click-and-wait "name=submit"))

(defun add-post ()
  (do-click-and-wait "css=#posts-grid input[name='add']")
  (do-type "name=title" "Some title")
  (do-type "name=short-text" "Some small description")
  (do-type "name=text" "Some text")
  (do-select "name=author" "index=1")
  (do-click-and-wait "name=submit"))

(deftest opens-blog-post ()
  (with-new-or-existing-selenium-session
    (do-click-and-wait "link=simple-blog: An example application")
    (do-click-and-wait "link=ADMIN")
    (add-user)
    (add-post)
    (do-click-and-wait "link=MAIN")
    (do-click-and-wait "css=li.title:nth-child(1) a")
    (do-click-and-wait "link=Simple Blog")))
