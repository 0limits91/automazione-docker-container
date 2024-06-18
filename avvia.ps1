$versione = "0.0.3"

$menu = @('1. Inizializza','2. Pianifica', '3. Applica', '4. Distruzione', '5. Distruzione veloce', '6. Info', '7. Esci')

function Mostra-Menu {
    Write-Host "----- Menu -----"
    for ($i = 0; $i -lt $menu.Count; $i++) {
        Write-Host "[$($i + 1)] $($menu[$i])"
    }
    Write-Host "----------------"
}

function Processa-Scelta {
    param(
        [Parameter(Mandatory = $true)]
        [int] $scelta
    )

    switch ($choice) {
        1 {
            Write-Host "Inizializzazione..."
            terraform.exe init
        }
        2 {
            Write-Host "Pianificazione in corso..."
            terraform.exe plan
        }
        3 {
            Write-Host "Applicazione delle modifiche in corso..."
            terraform.exe apply 
        }
        4 {
            Write-Host "Distruzione delle risorse in corso..."
            terraform.exe destroy 
            exit
        }
        5 {
            Write-Host "Distruzione veloce in corso..."
            terraform.exe destroy -auto-approve
        }
        6 {
            Write-Host "################################"
            Write-Host "# AUTOMAZIONE CONTAINER DOCKER #"
            Write-Host "#  FRANCESCO CAPPA (fcappa91)  #"
            Write-Host "################################"
            Write-Host "#       versione $versione         #"
            Write-Host "################################" 
            Write-Host "#           DESTROY            #"
            Write-Host "################################"
        }
        7 {
            Write-Host "Uscita in corso..."
            exit
        }
        default {
            Write-Host "Scelta non valida. Riprova."
        }
    }
}

do {
    Mostra-Menu
    $scelta = Read-Host "Inserisci il numero dell'opzione:"
    Processa-Scelta -scelta $scelta
} while ($true)