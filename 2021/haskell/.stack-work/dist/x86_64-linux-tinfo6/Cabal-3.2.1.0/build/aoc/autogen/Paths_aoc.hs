{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_aoc (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,0,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/mnt/c/Users/arthu/zeus/AoC/2021/haskell/.stack-work/install/x86_64-linux-tinfo6/233d00bbaa0f8f4705fcb45caf198a8a00331c2177baf37b4257f74f2efc7e38/8.10.7/bin"
libdir     = "/mnt/c/Users/arthu/zeus/AoC/2021/haskell/.stack-work/install/x86_64-linux-tinfo6/233d00bbaa0f8f4705fcb45caf198a8a00331c2177baf37b4257f74f2efc7e38/8.10.7/lib/x86_64-linux-ghc-8.10.7/aoc-0.0.1-3gEJ2hTssfM4KWnqeYPDPS-aoc"
dynlibdir  = "/mnt/c/Users/arthu/zeus/AoC/2021/haskell/.stack-work/install/x86_64-linux-tinfo6/233d00bbaa0f8f4705fcb45caf198a8a00331c2177baf37b4257f74f2efc7e38/8.10.7/lib/x86_64-linux-ghc-8.10.7"
datadir    = "/mnt/c/Users/arthu/zeus/AoC/2021/haskell/.stack-work/install/x86_64-linux-tinfo6/233d00bbaa0f8f4705fcb45caf198a8a00331c2177baf37b4257f74f2efc7e38/8.10.7/share/x86_64-linux-ghc-8.10.7/aoc-0.0.1"
libexecdir = "/mnt/c/Users/arthu/zeus/AoC/2021/haskell/.stack-work/install/x86_64-linux-tinfo6/233d00bbaa0f8f4705fcb45caf198a8a00331c2177baf37b4257f74f2efc7e38/8.10.7/libexec/x86_64-linux-ghc-8.10.7/aoc-0.0.1"
sysconfdir = "/mnt/c/Users/arthu/zeus/AoC/2021/haskell/.stack-work/install/x86_64-linux-tinfo6/233d00bbaa0f8f4705fcb45caf198a8a00331c2177baf37b4257f74f2efc7e38/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "aoc_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "aoc_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "aoc_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "aoc_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "aoc_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "aoc_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
