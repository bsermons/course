module Paths_course (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,4] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/bsermons/projects/personal/haskell/course/.stack-work/install/x86_64-linux/lts-3.12/7.10.2/bin"
libdir     = "/home/bsermons/projects/personal/haskell/course/.stack-work/install/x86_64-linux/lts-3.12/7.10.2/lib/x86_64-linux-ghc-7.10.2/course-0.1.4-81VEfDyQfZ595UusOAvMea"
datadir    = "/home/bsermons/projects/personal/haskell/course/.stack-work/install/x86_64-linux/lts-3.12/7.10.2/share/x86_64-linux-ghc-7.10.2/course-0.1.4"
libexecdir = "/home/bsermons/projects/personal/haskell/course/.stack-work/install/x86_64-linux/lts-3.12/7.10.2/libexec"
sysconfdir = "/home/bsermons/projects/personal/haskell/course/.stack-work/install/x86_64-linux/lts-3.12/7.10.2/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "course_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "course_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "course_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "course_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "course_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
