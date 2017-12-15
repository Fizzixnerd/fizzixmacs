-- | `(file-name-nondirectory buffer-file-name)`
-- Author: `(progn (hs-add-file-to-cabal) yatemplate-owner)`
-- License: `(yatemplate-get-license 'bsd2)`
-- Created: `(yatemplate-today)`
-- Summary: $0

{-# LANGUAGE Arrows #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
-- {-# LANGUAGE TemplateHaskell #-}
-- {-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeFamilies #-}

module `(hs-file-module-name)` where

import Control.Applicative
import Control.Arrow
import Control.Monad
import Data.Monoid

import Data.Text as T
import Data.Map as M
import Data.Vector as V

