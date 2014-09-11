Glounicode
==========

Glounicode is a library that encodes unicode strings using “glou”.

```
*Glounicode Data.List> let msg = glouencode "Glounicode is a library that encodes unicode strings using “glou”."
*Glounicode Data.List> intercalate " " msg 
"gloooooooouu glooooooooooouuuuuuuuu gloooooooooooouu gloooooooooooouuuuuuuu gloooooooooooou glooooooooooouuuuuu gloooooooooouuuuuuuuuu gloooooooooooouu glooooooooooou glooooooooooouu gloooouuu glooooooooooouuuuuu gloooooooooooouuuuuu gloooouuu gloooooooooouuuuuuuu gloooouuu glooooooooooouuuuuuuuu glooooooooooouuuuuu gloooooooooouuuuuuuuu gloooooooooooouuuuu gloooooooooouuuuuuuu gloooooooooooouuuuu glooooooooooooouu gloooouuu gloooooooooooouuuuuuu glooooooooooouuuuu gloooooooooouuuuuuuu gloooooooooooouuuuuuu gloooouuu glooooooooooouu gloooooooooooou gloooooooooouuuuuuuuuu gloooooooooooouu glooooooooooou glooooooooooouu gloooooooooooouuuuuu gloooouuu gloooooooooooouuuuuuuu gloooooooooooou glooooooooooouuuuuu gloooooooooouuuuuuuuuu gloooooooooooouu glooooooooooou glooooooooooouu gloooouuu gloooooooooooouuuuuu gloooooooooooouuuuuuu gloooooooooooouuuuu glooooooooooouuuuuu gloooooooooooou glooooooooooouuuu gloooooooooooouuuuuu gloooouuu gloooooooooooouuuuuuuu gloooooooooooouuuuuu glooooooooooouuuuuu gloooooooooooou glooooooooooouuuu gloooouuu glllouuu glou glooouuuuuuuuu glooooooooooouuuu glooooooooooouuuuuuuuu gloooooooooooouu gloooooooooooouuuuuuuu glllouuu glou glooouuuuuuuuuu glooooouuuuuuu"
*Glounicode Data.List> putStrLn $ gloudecode msg 
Glounicode is a library that encodes unicode strings using “glou”.
```
