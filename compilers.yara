/*
Compiler classification YARA rules
by nwunderly
*/

/**************\
| JS Compilers |
\**************/

rule Nexe // https://github.com/nexe/nexe
{
    meta:
        author = "nwunderly"
    
    strings:
        $nexe_sentinel = "<nexe~~sentinel>"
    
    condition:
        $nexe_sentinel at (filesize - 32)
}

rule Pkg // https://github.com/vercel/pkg
{
    meta:
        author = "nwunderly"
    
    strings:
        $pkg_prelude_bootstrap = "pkg/prelude/bootstrap.js"
        $pkg_version_mispatch = "Pkg: VERSION_MISMATCH"
        $pkg_length_mismatch = "Pkg: LENGTH_MISMATCH"
        $pkg_checksum_mismatch = "Pkg: CHECKSUM_MISMATCH"


    condition:
        all of them
}


/*************\
| Rust Builds |
\*************/

rule Rust
{
    meta:
        author = "nwunderly"
    
    strings:
        $rustc = "rustc"
        $rust_backtrace = "RUST_BACKTRACE"
        $rust_panic = "rust_panic"
    
    condition:
        all of them
}