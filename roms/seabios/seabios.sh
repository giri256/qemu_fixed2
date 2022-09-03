    qemu_hd_replacement="WD5000AAKS-40V28O"
    qemu_dvd_replacement="OPTIARC DVD RW AD-5680H"
    hypervisor_string_replacement="GenuineIntel"
    bochs_cpu_replacement="INTELCPU"
    qemu_bochs_cpu='INTEL\/INTEL'
    qemu_space_replacement="intel "
    src_misc_bios_table="07\/02\/18"
    src_bios_table_date2="11\/03\/2018"
    src_fw_smbios_date="11\/03\/2018"
    #seabios
    sed -i "s/Bochs/Apple/g" src/config.h
    sed -i "s/BOCHSCPU/$bochs_cpu_replacement/g" src/config.h
    sed -i 's/"BOCHS "/"Apple"/g' src/config.h
    sed -i 's/BXPC/Apple/g' src/config.h
    sed -i "s/QEMU\/Bochs/$qemu_bochs_cpu/g" vgasrc/Kconfig
    sed -i "s/qemu /$qemu_space_replacement/g" vgasrc/Kconfig
    sed -i "s/06\/23\/99/$src_misc_bios_table/g" src/misc.c
    sed -i "s/04\/01\/2014/$src_bios_table_date2/g" src/fw/biostables.c
    sed -i "s/01\/01\/2011/$src_fw_smbios_date/g" src/fw/smbios.c
    sed -i 's/"SeaBios"/"AMIBios"/g' src/fw/biostables.c

    FILES=(
        src/hw/blockcmd.c
        src/fw/paravirt.c
    )
    for file in "${FILES[@]}"; do
        sed -i 's/"QEMU/"CR32/g' "$file" "QEMU was not replaced in $file"
    done

    sed -i 's/"QEMU"/"CR32"/g' src/hw/blockcmd.c '"QEMU" was not replaced in  src/hw/blockcmd.c'

    FILES=(
        "src/fw/acpi-dsdt.dsl"
        "src/fw/q35-acpi-dsdt.dsl"
    )
    for file in "${FILES[@]}"; do
        sed -i 's/"BXPC"/"CR32"/g' "$file" "BXPC was not replaced in $file"
    done
    sed -i 's/"BXPC"/"AMPC"/g' "src/fw/ssdt-pcihp.dsl" 'BXPC was not replaced in src/fw/ssdt-pcihp.dsl'
    sed -i 's/"BXDSDT"/"AMDSDT"/g' "src/fw/ssdt-pcihp.dsl" 'BXDSDT was not replaced in src/fw/ssdt-pcihp.dsl'
    sed -i 's/"BXPC"/"AMPC"/g' "src/fw/ssdt-proc.dsl" 'BXPC was not replaced in "src/fw/ssdt-proc.dsl"'
    sed -i 's/"BXSSDT"/"AMSSDT"/g' "src/fw/ssdt-proc.dsl" 'BXSSDT was not replaced in src/fw/ssdt-proc.dsl'
    sed -i 's/"BXPC"/"AMPC"/g' "src/fw/ssdt-misc.dsl" 'BXPC was not replaced in src/fw/ssdt-misc.dsl'
    sed -i 's/"BXSSDTSU"/"AMSSDTSU"/g' "src/fw/ssdt-misc.dsl" 'BXDSDT was not replaced in src/fw/ssdt-misc.dsl'
    sed -i 's/"BXSSDTSUSP"/"AMSSDTSUSP"/g' src/fw/ssdt-misc.dsl 'BXSSDTSUSP was not replaced in src/fw/ssdt-misc.dsl'
    sed -i 's/"BXSSDT"/"AMSSDT"/g' src/fw/ssdt-proc.dsl 'BXSSDT was not replaced in src/fw/ssdt-proc.dsl'
    sed -i 's/"BXSSDTPCIHP"/"AMSSDTPCIHP"/g' src/fw/ssdt-pcihp.dsl 'BXPC was not replaced in src/fw/ssdt-pcihp.dsl'

    FILES=(
        src/fw/q35-acpi-dsdt.dsl
        src/fw/acpi-dsdt.dsl
        src/fw/ssdt-misc.dsl
        src/fw/ssdt-proc.dsl
        src/fw/ssdt-pcihp.dsl
        src/config.h
    )
    for file in "${FILES[@]}"; do
        sed -i 's/"BXPC"/"A M I"/g' "$file" "BXPC was not replaced in $file"
    done
