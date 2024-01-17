import Link from "next/link";
import * as gtag from "../../lib/gtag";

interface NavigationItem {
  name: string;
  href: string;
  target: string;
}

export const Navigation = () => {
  const links: NavigationItem[] = [
    { name: "Home", href: "/", target: "" },
    { name: "Resume", href: "/resume.pdf", target: "_blank" },
  ];

  const onClickItem = (item: NavigationItem) => () => {
    gtag.event({
      action: "navigation_click",
      category: "navigation",
      label: item.href,
      value: 1,
    });
  };

  return (
    <nav className="my-5 animate-fade-in">
      <ul className="flex items-start justify-start gap-4">
        {links.map((item) => (
          <Link
            key={item.href}
            href={item.href}
            target={item.target}
            className="text-md duration-200 text-slate-50 hover:text-slate-400"
            onClick={onClickItem(item)}
          >
            {item.name}
          </Link>
        ))}
      </ul>
    </nav>
  );
};
