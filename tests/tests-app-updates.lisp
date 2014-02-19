(in-package :weblocks-examples-tests)

(defmethod weblocks:render-page-body :around ((app weblocks-selenium-tests-app::weblocks-selenium-tests-app) body-string)
  (unless (weblocks:get-webapp :simple-blog nil)
    (simple-blog:start-simple-blog :prefix "/simple-blog"))
  (call-next-method))
