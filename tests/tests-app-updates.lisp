(in-package :weblocks-examples-tests)

(defmethod weblocks:render-page-body :around ((app weblocks-selenium-tests-app::weblocks-selenium-tests-app) body-string)
  (unless (weblocks:get-webapp :simple-blog nil)
    (simple-blog:start-simple-blog :prefix "/simple-blog"))
  (unless (weblocks:get-webapp :weblocks-clsql-demo nil)
    (weblocks-clsql-demo:start-weblocks-clsql-demo :prefix "/clsql-demo"))
  (unless (weblocks:get-webapp :weblocks-demo nil)
    (weblocks-demo:start-weblocks-demo :prefix "/weblocks-demo"))
  (unless (weblocks:get-webapp :weblocks-elephant-demo nil)
    (weblocks-elephant-demo:start-weblocks-elephant-demo :prefix "/elephant-demo"))
    
  (call-next-method))
