import Link from "next/link";

export const Navigation = () => {
  const links = [
    { name: "Home", href: "/", target: "" },
    { name: "Resume", href: "/resume.pdf", target: "_blank" },
  ];

  return (
    <nav className="my-5 animate-fade-in">
      <ul className="flex items-start justify-start gap-4">
        {links.map((item) => (
          <Link
            key={item.href}
            href={item.href}
            target={item.target}
            className="text-md duration-200 text-slate-50 hover:text-slate-400"
          >
            {item.name}
          </Link>
        ))}
      </ul>
    </nav>
  );
};
