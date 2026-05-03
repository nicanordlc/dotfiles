interface Package {
  status: string;
  fecha: string;
  tracking: string;
  suplidor: string;
  contenido: string;
  peso: string;
}

let packages: Package[];
try {
  const response = await fetch("http://localhost:8000/packages");

  if (!response.ok) {
    throw new Error(`HTTP error! status: ${response.status}`);
  }

  packages = await response.json();
} catch (error) {
  console.log("📦");
  process.exit(0);
}

// Configuration for status mapping
const match = {
  miami: ['Almacén origen'],
  shipped: ['Línea aérea', 'Embarcado'],
  island: ['Transito oficina', 'Aduana'],
  ready: ['Disponible'],
};

// Single pass through the data
const stats = packages.reduce(
  (acc, p) => {
    if (match.miami.includes(p.status)) acc.miami++;
    else if (match.shipped.includes(p.status)) acc.shipped++;
    else if (match.island.includes(p.status)) acc.island++;
    else if (match.ready.includes(p.status)) acc.ready++;
    return acc;
  },
  { miami: 0, shipped: 0, island: 0, ready: 0 }
);

// Print the status line
console.log(
  `📦: 🏬 ${stats.miami} - ✈️  ${stats.shipped} - 🏝  ${stats.island} - 🏠 ${stats.ready}`
);
