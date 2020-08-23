using SteelEngine.ECS.Components;
using System.Collections;
using System;

namespace SteelEngine.ECS.Systems
{
	public class BehaviorSystem : BaseSystem
	{
		protected override void RegisterComponentTypes()
		{
			_registeredTypes = new Type[]{ typeof(BehaviorComponent) };
		}

		protected override void Update(EntityId entityId, List<BaseComponent> components, float delta)
		{
			Entity entity = ?;
			if (!Entity.EntityStore.TryGetValue(entityId, out entity) || !entity.IsEnabled)
			{
				return;
			}
			
			for (let component in components)
			{
				if (!component.IsEnabled)
				{
					continue;
				}
				((BehaviorComponent) component).[Friend]Update(delta);
			}
		}
	}
}
